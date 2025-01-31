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
    Schema::create('students', function (Blueprint $table) {
        $table->id(); // Primary key
        $table->string('name');
        $table->string('email')->unique();
        $table->string('matric_number')->unique();
        $table->timestamps();
    });
}

public function down()
{
    Schema::dropIfExists('students');
}
};
