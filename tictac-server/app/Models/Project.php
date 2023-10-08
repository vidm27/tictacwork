<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Project extends Model
{
    use HasUuids;

    protected $fillable = ['title', 'client_id'];


    public function client(): BelongsTo
    {
        return $this->belongsTo(Client::class);
    }
    public function task(): BelongsTo
    {
        return $this->belongsTo(Task::class);
    }
}
