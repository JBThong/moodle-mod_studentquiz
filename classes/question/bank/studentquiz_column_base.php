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

namespace mod_studentquiz\bank;

defined('MOODLE_INTERNAL') || die();

/**
 * Represent studentquiz column base in studentquiz_bank_view
 *
 * @package mod_studentquiz
 * @copyright 2021 The Open University.
 * @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
abstract class studentquiz_column_base extends \core_question\bank\column_base {

    /**
     * Output the opening column tag.
     *
     * @param \stdClass $question
     * @param string $rowclasses
     */
    public function display_start($question, $rowclasses) {
        $tag = 'td';
        $classes = $this->get_classes();
        if (!empty($question->sq_hidden)) {
            $classes .= ' dimmed_text';
        }
        $attr = ['class' => $classes];
        if ($this->isheading) {
            $tag = 'th';
            $attr['scope'] = 'row';
        }
        echo \html_writer::start_tag($tag, $attr);
    }
}
