<?php

namespace App\Http\Controllers;

use App\Models\Movie;
use App\Models\Release;
use Illuminate\Http\Request;

class MovieController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
         $query = Movie::query()
        ->with(['release'])->get();
        return response()->json($query); 
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        $new = Movie::create([
            'title'=> $request->title,
            'description'=> $request->description,
            'age_rating'=>$request->age_rating,
            'language'=>$request->language,
            'cover_image'=>$request->cover_image
        ]);
        $lastInsertId = $new->id;
        $release = Release::create([
            'date' => $request->date,
            'available_seats' => $request->available_seats,
            'movie_id' => $lastInsertId,
        ]);
        return response()->json(array('message' => 'Sikeres létrehozás!'),200);

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Movie $movie)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Movie $movie)
    {
        
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Movie $movie, $id)
    {
        $movie = Movie::find($id);
        $movie->title = $request->title;
        $movie->description = $request->description;    
        $movie->age_rating = $request->age_rating;
        $movie->save();

        $movie_release = Release::where('movie_id',$id)->first();
        $movie_release->date = $request->date;
        $movie_release->available_seats = $request->available_seats;
        $movie_release->save();
        return response()->json(array('message' => 'Sikeres frissítés!'),200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $movie = Movie::find($id);
        $movie->delete();
        return response()->json(array('message' => 'Sikeres törlés!'),200);
    }
}
