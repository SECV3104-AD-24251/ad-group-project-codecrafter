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
    Schema::table('messages', function (Blueprint $table) {
        $table->unsignedBigInteger('receiver_id')->nullable();
        $table->unsignedBigInteger('sender_id')->nullable();

        // Optional: Add foreign key constraints if users table exists
        // $table->foreign('receiver_id')->references('id')->on('users')->onDelete('cascade');
        // $table->foreign('sender_id')->references('id')->on('users')->onDelete('cascade');
    });
}

public function down()
{
    Schema::table('messages', function (Blueprint $table) {
        $table->dropColumn(['receiver_id', 'sender_id']);
    });
}

};
