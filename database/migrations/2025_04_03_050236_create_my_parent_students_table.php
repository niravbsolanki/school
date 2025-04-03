<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('my_parent_students', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('my_parent_id');
            $table->foreign('my_parent_id')->references('id')->on('my_parents')->onUpdate('cascade')->onDelete('cascade');
            $table->unsignedBigInteger('student_id');
            $table->foreign('student_id')->references('id')->on('students')->onUpdate('cascade')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('my_parent_students');
    }
};
