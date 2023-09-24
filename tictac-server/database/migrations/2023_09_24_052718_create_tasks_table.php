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
        Schema::create('tasks', function (Blueprint $table) {
            $table->uuid(column:'id')->unique();
            $table->string('title',length:500);
            $table->timestamp('duration');
            $table->timestamp('momnetStart');
            $table->timestamp('momnetEnd');
            $table->foreignUuid('project_id')->constrained('projects')->onUpdate('cascade')->onDelete('cascade');
            $table->foreignUuid('tag_id')->nullable()->constrained('tags');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tasks');
    }
};
