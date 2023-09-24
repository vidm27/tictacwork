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
        Schema::create('monetizes', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->decimal('hour_price', 6, 2);
            $table->decimal('part_time_price', 6, 2);
            $table->datetime('created')->default(now());
            $table->datetime('modified')->nullable();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('monetizes');
    }
};
