<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Movie extends Model
{
    public function release(): HasOne
    {
        return $this->hasOne(Release::class);
    }
    protected $fillable =[
        'id',
        'title',
        'description',
        'age_rating',
        'language',
        'cover_image'
    ];
    public $timestamps = false;
}
