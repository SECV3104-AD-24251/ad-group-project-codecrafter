<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('consultations', function (Blueprint $table) {
            $table->id(); // Auto-increment primary key
            $table->unsignedBigInteger('student_id'); // Reference to users table
            $table->unsignedBigInteger('advisor_id'); // Reference to advisors (users table)
            $table->text('message')->nullable(); // Optional initial message
            $table->enum('status', ['pending', 'confirmed', 'completed', 'canceled'])->default('pending'); // Status of consultation
            $table->timestamps(); // created_at & updated_at

            // Foreign key constraints
            $table->foreign('student_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('advisor_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('consultations');
    }
};
