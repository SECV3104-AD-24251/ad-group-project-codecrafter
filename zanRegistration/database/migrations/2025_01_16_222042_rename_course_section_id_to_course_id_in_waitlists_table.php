<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
{
    Schema::table('waitlists', function (Blueprint $table) {
        $table->renameColumn('course_section_id', 'course_id');
    });
}

public function down()
{
    Schema::table('waitlists', function (Blueprint $table) {
        $table->renameColumn('course_id', 'course_section_id');
    });
}

};
