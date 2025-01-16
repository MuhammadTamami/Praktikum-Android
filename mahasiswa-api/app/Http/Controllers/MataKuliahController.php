<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MataKuliah;
class MataKuliahController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Matakuliah::all();//
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $mataKuliah = MataKuliah::create($request->all());
        return response()->json($mataKuliah, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return MataKuliah::find($id);//
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $mataKuliah = MataKuliah::find($id);
        $mataKuliah->update($request->all());
        return response()->json($mataKuliah, 200);//
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        MataKuliah::destroy($id);//
        return response()->json(null, 204);
    }
}
