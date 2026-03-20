#!/usr/bin/env node

/**
 * Max Self-Reflection Execution Script
 *
 * Functions:
 * 1. Analyze errors in current session
 * 2. Generate reflection reports
 * 3. Automatically update CLAUDE.md file
 * 4. Record learning outcomes to reflection-log.json
 *
 * Usage:
 *   node execute-reflection.js analyze <error-type> <description>
 *   node execute-reflection.js report
 *   node execute-reflection.js update-rules <error-id>
 *   node execute-reflection.js stats
 *   node execute-reflection.js calibrate <estimated> <actual>
 */

const fs = require('fs');
const path = require('path');

// Path configuration
const BASE_DIR = path.resolve(__dirname, '..');
const PATHS = {
  reflectionLog: path.join(BASE_DIR, 'memory', 'reflection-log.json'),
  reflectionPatterns: path.join(__dirname, 'reflection-patterns.json'),
  claudeMd: path.join(BASE_DIR, 'CLAUDE.md'),
  violationsLog: path.join(BASE_DIR, 'memory', 'violations.log'),
};

// Ensure directory exists
function ensureDir(filePath) {
  const dir = path.dirname(filePath);
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
}

// Read JSON file (with default value)
function readJson(filePath, defaultValue) {
  try {
    if (fs.existsSync(filePath)) {
      return JSON.parse(fs.readFileSync(filePath, 'utf8'));
    }
  } catch (e) {
    console.error(`[WARN] Failed to read ${filePath}: ${e.message}`);
  }
  return defaultValue;
}

// Write JSON file
function writeJson(filePath, data) {
  ensureDir(filePath);
  fs.writeFileSync(filePath, JSON.stringify(data, null, 2), 'utf8');
}

// Generate error ID
function generateErrorId() {
  const now = new Date();
  const date = now.toISOString().slice(0, 10).replace(/-/g, '');
  const seq = String(Math.floor(Math.random() * 999) + 1).padStart(3, '0');
  return `ERR-${date}-${seq}`;
}

// Get current date time
function nowISO() {
  return new Date().toISOString();
}

// ==================== Core Functions ====================

/**
 * Analyze errors and record
 */
function analyzeError(errorType, description, context = {}) {
  const patterns = readJson(PATHS.reflectionPatterns, { error_categories: {}, historical_errors: [] });
  const log = readJson(PATHS.reflectionLog, { errors: [], stats: {}, last_review: null });

  // Parse error type
  const [mainType, subType] = parseErrorType(errorType);
  const category = patterns.error_categories[mainType];

  if (!category) {
    console.error(`[ERROR] Unknown error type: ${errorType}`);
    console.log('Available types: E-TOKEN, E-AUTH, E-SCOPE, E-FLOW, E-LOGIC, E-TOOL');
    process.exit(1);
  }

  const errorId = generateErrorId();

  // Build error record
  const errorRecord = {
    id: errorId,
    date: nowISO(),
    category: errorType,
    severity: category.severity,
    description: description,
    context: {
      task_description: context.task || 'Not provided',
      estimated_tokens: context.estimated || null,
      actual_tokens: context.actual || null,
      deviation_ratio: (context.estimated && context.actual)
        ? (context.actual / context.estimated).toFixed(2)
        : null,
    },
    root_cause: null,
    resolution: {
      immediate: null,
      rule_added: null,
      prevention: null,
    },
    status: 'pending_analysis',
    lessons_learned: null,
  };

  // Auto-fill token deviation analysis
  if (mainType === 'E-TOKEN' && context.estimated && context.actual) {
    const ratio = context.actual / context.estimated;
    errorRecord.root_cause = ratio > 1.5
      ? `Token estimation ${((ratio - 1) * 100).toFixed(0)}% too low, possible causes: task complexity underestimation, multi-file cumulative consumption not considered, calibration coefficient not applied`
      : `Token estimation ${((1 - ratio) * 100).toFixed(0)}% too high, possible cause: task was simpler than expected`;

    errorRecord.resolution.prevention = `Update calibration coefficient, current deviation ratio: ${ratio.toFixed(2)}x`;
  }

  // Auto-fill authorization violation analysis
  if (mainType === 'E-AUTH') {
    errorRecord.root_cause = 'Authorization check step was skipped or not executed properly';
    errorRecord.resolution.immediate = 'Stop operation immediately, apologize to user and request authorization';
    errorRecord.resolution.prevention = 'Add mandatory authorization verification checkpoint before operation execution';
  }

  // Log to file
  log.errors.push(errorRecord);

  // Update statistics
  if (!log.stats[mainType]) {
    log.stats[mainType] = { count: 0, last_occurrence: null };
  }
  log.stats[mainType].count += 1;
  log.stats[mainType].last_occurrence = nowISO();

  writeJson(PATHS.reflectionLog, log);

  // Also record to patterns historical_errors
  patterns.historical_errors.push(errorRecord);
  writeJson(PATHS.reflectionPatterns, patterns);

  // Output reflection report
  console.log('');
  console.log('='.repeat(60));
  console.log('  Self-Reflection Report');
  console.log('='.repeat(60));
  console.log('');
  console.log(`Error ID:   ${errorId}`);
  console.log(`Type:       ${errorType} (${category.name})`);
  console.log(`Severity:   ${category.severity}`);
  console.log(`Description: ${description}`);
  console.log(`Time:       ${errorRecord.date}`);
  console.log('');

  if (errorRecord.context.deviation_ratio) {
    console.log(`Token deviation: estimated ${context.estimated} vs actual ${context.actual} (${errorRecord.context.deviation_ratio}x)`);
    console.log('');
  }

  if (errorRecord.root_cause) {
    console.log(`Root cause: ${errorRecord.root_cause}`);
    console.log('');
  }

  // Find improvement template
  const templateKey = Object.keys(patterns.improvement_templates || {}).find(
    k => patterns.improvement_templates[k].applies_to === mainType
  );
  if (templateKey) {
    const template = patterns.improvement_templates[templateKey].template;
    console.log('Suggested Improvement Measures:');
    console.log(`  Immediate fix:    ${template.immediate_action}`);
    console.log(`  Rule update:      ${template.rule_update}`);
    console.log(`  Detection enhancement: ${template.detection_enhancement}`);
    console.log(`  Prevention measure: ${template.prevention}`);
    console.log('');
  }

  console.log('='.repeat(60));
  console.log(`Record saved to: ${PATHS.reflectionLog}`);
  console.log('');

  return errorId;
}

/**
 * Generate statistics report
 */
function generateStats() {
  const log = readJson(PATHS.reflectionLog, { errors: [], stats: {} });
  const patterns = readJson(PATHS.reflectionPatterns, { error_categories: {} });

  console.log('');
  console.log('='.repeat(60));
  console.log('  Error Statistics Report');
  console.log('='.repeat(60));
  console.log('');

  const totalErrors = log.errors.length;
  console.log(`Total errors: ${totalErrors}`);
  console.log('');

  if (totalErrors === 0) {
    console.log('No error records yet.');
    return;
  }

  // Statistics by type
  console.log('Distribution by type:');
  console.log('-'.repeat(40));
  for (const [type, data] of Object.entries(log.stats)) {
    const cat = patterns.error_categories[type];
    const catName = (cat && cat.name) ? cat.name : type;
    const lastOcc = data.last_occurrence ? data.last_occurrence.slice(0, 10) : 'Unknown';
    console.log(`  ${type} (${catName}): ${data.count} times | Latest: ${lastOcc}`);
  }
  console.log('');

  // Statistics by severity
  const severityCounts = { critical: 0, high: 0, medium: 0, low: 0 };
  log.errors.forEach(err => {
    const mainType = err.category.split('-').slice(0, 2).join('-');
    const mainCat = patterns.error_categories[mainType];
    const severity = (mainCat && mainCat.severity) ? mainCat.severity : 'unknown';
    if (severityCounts[severity] !== undefined) {
      severityCounts[severity]++;
    }
  });
  console.log('Distribution by severity:');
  console.log('-'.repeat(40));
  console.log(`  Critical: ${severityCounts.critical}`);
  console.log(`  High:     ${severityCounts.high}`);
  console.log(`  Medium:   ${severityCounts.medium}`);
  console.log(`  Low:      ${severityCounts.low}`);
  console.log('');

  // Unresolved errors
  const pending = log.errors.filter(e => e.status === 'pending_analysis');
  if (pending.length > 0) {
    console.log(`Pending analysis errors: ${pending.length}`);
    pending.forEach(e => {
      console.log(`  - ${e.id}: ${e.description}`);
    });
    console.log('');
  }

  // Token deviation trend
  const tokenErrors = log.errors.filter(e => e.category.startsWith('E-TOKEN') && e.context.deviation_ratio);
  if (tokenErrors.length > 0) {
    const avgDeviation = tokenErrors.reduce((sum, e) => sum + parseFloat(e.context.deviation_ratio), 0) / tokenErrors.length;
    console.log(`Token estimation average deviation ratio: ${avgDeviation.toFixed(2)}x`);
    console.log('');
  }

  console.log('='.repeat(60));
}

/**
 * Generate complete reflection report
 */
function generateReport() {
  const log = readJson(PATHS.reflectionLog, { errors: [], stats: {} });

  console.log('');
  console.log('='.repeat(60));
  console.log('  Complete Reflection Report');
  console.log('='.repeat(60));
  console.log('');

  if (log.errors.length === 0) {
    console.log('No error records yet.');
    return;
  }

  log.errors.forEach((err, idx) => {
    console.log(`--- Error #${idx + 1} ---`);
    console.log(`ID:       ${err.id}`);
    console.log(`Date:     ${err.date}`);
    console.log(`Type:     ${err.category}`);
    console.log(`Severity: ${err.severity}`);
    console.log(`Description: ${err.description}`);
    console.log(`Status:   ${err.status}`);

    if (err.root_cause) {
      console.log(`Root cause: ${err.root_cause}`);
    }
    if (err.lessons_learned) {
      console.log(`Lessons:  ${err.lessons_learned}`);
    }

    if (err.context.deviation_ratio) {
      console.log(`Token deviation: ${err.context.deviation_ratio}x (estimated ${err.context.estimated_tokens} / actual ${err.context.actual_tokens})`);
    }

    console.log('');
  });

  console.log('='.repeat(60));
}

/**
 * Token estimation calibration
 */
function calibrateTokens(estimated, actual) {
  const patterns = readJson(PATHS.reflectionPatterns, { calibration_data: {} });
  const calData = patterns.calibration_data;
  const calibration = (calData && calData.token_estimation) ? calData.token_estimation : {};

  const ratio = actual / estimated;

  console.log('');
  console.log('='.repeat(60));
  console.log('  Token Estimation Calibration');
  console.log('='.repeat(60));
  console.log('');
  console.log(`Estimated: ${estimated} tokens`);
  console.log(`Actual:    ${actual} tokens`);
  console.log(`Ratio:     ${ratio.toFixed(2)}x`);
  console.log(`Deviation rate: ${((ratio - 1) * 100).toFixed(1)}%`);
  console.log('');

  if (ratio > 1.5) {
    console.log('Diagnosis: Severe underestimation - need to increase calibration coefficient');
    console.log('');
    console.log('Suggested calibration adjustment:');

    const baselines = calibration.task_type_baselines || {};
    for (const [type, data] of Object.entries(baselines)) {
      const newCoeff = Math.min(3.0, Math.max(0.5, 0.7 * data.coefficient + 0.3 * ratio));
      console.log(`  ${type}: ${data.coefficient} -> ${newCoeff.toFixed(2)}`);
    }
  } else if (ratio < 0.5) {
    console.log('Diagnosis: Severe overestimation - can reduce calibration coefficient');
  } else {
    console.log('Diagnosis: Estimation within reasonable range');
  }

  console.log('');
  console.log('='.repeat(60));

  // If severe deviation, automatically record error
  if (ratio > 1.5 || ratio < 0.5) {
    const errorType = ratio > 1.5 ? 'E-TOKEN-LOW' : 'E-TOKEN-HIGH';
    const desc = `Token estimation deviation: estimated ${estimated}, actual ${actual} (${ratio.toFixed(2)}x)`;
    analyzeError(errorType, desc, { estimated, actual });
  }
}

/**
 * Update learning records in CLAUDE.md
 */
function updateClaudeMd(errorId) {
  const log = readJson(PATHS.reflectionLog, { errors: [] });
  const error = log.errors.find(e => e.id === errorId);

  if (!error) {
    console.error(`[ERROR] Error record not found: ${errorId}`);
    process.exit(1);
  }

  // Read current CLAUDE.md
  let claudeContent = fs.readFileSync(PATHS.claudeMd, 'utf8');

  // Check if learning records section exists
  const learningHeader = '## Learning Records (Automatically maintained by self-reflection system)';
  if (!claudeContent.includes(learningHeader)) {
    // Add learning records section at end of file
    claudeContent += `\n\n${learningHeader}\n\n`;
  }

  // Build new learning entry
  const date = error.date.slice(0, 10);
  const entry = [
    `### ${date} - ${error.id}`,
    `**Error**: ${error.category} - ${error.description}`,
    `**Root Cause**: ${error.root_cause || 'Pending analysis'}`,
    `**New Rule**: ${(error.resolution && error.resolution.rule_added) ? error.resolution.rule_added : 'To be determined'}`,
    `**Prevention**: ${(error.resolution && error.resolution.prevention) ? error.resolution.prevention : 'To be determined'}`,
    `**Status**: ${error.status}`,
    '',
  ].join('\n');

  // Add to end of learning records section
  const headerIndex = claudeContent.indexOf(learningHeader);
  const insertPos = headerIndex + learningHeader.length + 2;
  claudeContent = claudeContent.slice(0, insertPos) + entry + '\n' + claudeContent.slice(insertPos);

  fs.writeFileSync(PATHS.claudeMd, claudeContent, 'utf8');

  // Update error status
  error.status = 'rule_updated';
  writeJson(PATHS.reflectionLog, log);

  console.log('');
  console.log(`CLAUDE.md updated - added learning record: ${errorId}`);
  console.log(`Error status updated to: rule_updated`);
  console.log('');
}

// ==================== Helper Functions ====================

function parseErrorType(errorType) {
  const parts = errorType.split('-');
  const mainType = parts.slice(0, 2).join('-');
  const subType = parts.length > 2 ? errorType : null;
  return [mainType, subType];
}

function printUsage() {
  console.log(`
Max Self-Reflection Execution Script
====================

Usage:
  node execute-reflection.js <command> [arguments]

Commands:
  analyze <error-type> <description>    Analyze and record error
    Optional parameters (passed via environment variables):
      ESTIMATED=<num>  Estimated token count
      ACTUAL=<num>     Actual token count

  report                                 Generate complete reflection report

  stats                                  Display error statistics

  calibrate <estimated> <actual>         Token estimation calibration

  update-rules <error-id>               Update error learning outcomes to CLAUDE.md

Error types:
  E-TOKEN-LOW    Severe token underestimation
  E-TOKEN-HIGH   Severe token overestimation
  E-TOKEN-MISS   No token estimation performed
  E-AUTH-OPUS    Unauthorized Opus usage
  E-AUTH-GIT     Unauthorized Git operations
  E-AUTH-BOUNDARY Responsibility boundary violation
  E-SCOPE-OVER   Over-engineering
  E-SCOPE-UNDER  Under-delivery
  E-FLOW-SKIP    Checkpoint skipping
  E-FLOW-ORDER   Checkpoint sequence error
  E-LOGIC-ANALYSIS Analysis reasoning error
  E-LOGIC-DECISION Decision error
  E-TOOL-WRONG   Tool selection error
  E-TOOL-MISUSE  Tool parameter error

Examples:
  node execute-reflection.js analyze E-TOKEN-LOW "estimated 3000 actual 17000"
  ESTIMATED=3000 ACTUAL=17000 node execute-reflection.js analyze E-TOKEN-LOW "description"
  node execute-reflection.js calibrate 3000 17000
  node execute-reflection.js stats
  node execute-reflection.js update-rules ERR-20260219-001
  `);
}

// ==================== Main Entry ====================

function main() {
  const args = process.argv.slice(2);

  if (args.length === 0) {
    printUsage();
    process.exit(0);
  }

  const command = args[0];

  switch (command) {
    case 'analyze': {
      if (args.length < 3) {
        console.error('[ERROR] Usage: analyze <error-type> <description>');
        process.exit(1);
      }
      const errorType = args[1];
      const description = args.slice(2).join(' ');
      const context = {
        estimated: process.env.ESTIMATED ? parseInt(process.env.ESTIMATED) : null,
        actual: process.env.ACTUAL ? parseInt(process.env.ACTUAL) : null,
        task: process.env.TASK || null,
      };
      analyzeError(errorType, description, context);
      break;
    }

    case 'report':
      generateReport();
      break;

    case 'stats':
      generateStats();
      break;

    case 'calibrate': {
      if (args.length < 3) {
        console.error('[ERROR] Usage: calibrate <estimated> <actual>');
        process.exit(1);
      }
      calibrateTokens(parseInt(args[1]), parseInt(args[2]));
      break;
    }

    case 'update-rules': {
      if (args.length < 2) {
        console.error('[ERROR] Usage: update-rules <error-id>');
        process.exit(1);
      }
      updateClaudeMd(args[1]);
      break;
    }

    default:
      console.error(`[ERROR] Unknown command: ${command}`);
      printUsage();
      process.exit(1);
  }
}

main();
