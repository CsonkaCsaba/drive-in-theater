<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Release extends Model
{
    public function movie(): BelongsTo
    {
        return $this->belongsTo(Movie::class);
    }
    protected $fillable =[
        'id',
        'date',
        'available_seats',
        'movie_id'
    ];
    public $timestamps = false;
}
