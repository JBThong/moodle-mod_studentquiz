<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * This page displays the student ranks generated by /mod/studentquiz.
 *
 * @package    mod_studentquiz
 * @copyright  2017 HSR (http://www.hsr.ch)
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
use mod_studentquiz\utils;

require_once(__DIR__ . '/../../config.php');
require_once(__DIR__ . '/reportlib.php');

$cmid = optional_param('id', 0, PARAM_INT);
if (!$cmid) {
    $cmid = required_param('cmid', PARAM_INT);
}

$report = new mod_studentquiz_report($cmid);
$cm = $report->get_coursemodule();

require_login($report->get_course(), false, $cm);
$context = $report->get_context();
$output = $PAGE->get_renderer('mod_studentquiz', 'ranking');

if ($errormessage = utils::check_access_permission_of_group($context, $cm)) {
    $output->render_error_message($errormessage, $report->get_ranking_title());
}

$PAGE->set_title($report->get_ranking_title());
$PAGE->set_heading($report->get_heading());
$PAGE->set_context($report->get_context());
$PAGE->set_url($report->get_rank_url());

echo $OUTPUT->header();

echo $output->view_rank($report);

echo $OUTPUT->footer();

// Trigger report rank viewed event.
mod_studentquiz_reportrank_viewed($report->get_cm_id(), $context);
