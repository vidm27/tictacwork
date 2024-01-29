<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Task extends Model
{
    use HasUuids;
    use HasFactory;

    protected $fillable = ['title', 'duration', 'moment_start', 'moment_end', 'project_id', 'tag_id'];

    public function projects(): HasMany{
        return $this->hasMany(Project::class);
    }

}
