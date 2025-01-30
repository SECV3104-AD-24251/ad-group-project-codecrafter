<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
    Schema::table('courses', function (Blueprint $table) {
        $table->string('day'); // Example: 'Monday', 'Tuesday', etc.
        $table->time('start_time');
        $table->time('end_time');
        $table->integer('credit_hours');
    });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('courses', function (Blueprint $table) {
            //
        });
    }
};
