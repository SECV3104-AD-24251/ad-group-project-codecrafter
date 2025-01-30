<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RemoveCreditHoursFromCourses extends Migration
{
    public function up()
    {
        Schema::table('courses', function (Blueprint $table) {
            $table->dropColumn('credit_hours');
        });
    }

    public function down()
    {
        Schema::table('courses', function (Blueprint $table) {
            $table->integer('credit_hours')->default(0); // Restore column
        });
    }
}
