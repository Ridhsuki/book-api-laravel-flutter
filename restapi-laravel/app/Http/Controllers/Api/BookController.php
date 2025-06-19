<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Book;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class BookController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Book::orderBy('title', 'asc')->get();

        return response()->json([
            'status' => true,
            'msg' => 'Data FOunded!',
            'data' => $data

        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $dataBook = new Book;

        $rules = [
            'title' => 'required',
            'writer' => 'required',
            'release' => 'required|date'
        ];

        $validator = validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                'status' => false,
                'msg' => 'Cannot Add New Data',
                'data' => $validator->errors()
            ],404);
        }

        $dataBook->title = $request->title;
        $dataBook->writer = $request->writer;
        $dataBook->release = $request->release;

        $post = $dataBook->save();

        return response()->json([
            'status' => true,
            'msg' => 'Succes to Add new Data!'
        ], 200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $data = Book::find($id);

        if (empty($data)) {
            return response()->json([
                'status' => false,
                'msg' => "Data not found!"
            ], 404);
        } else {
            return response()->json([
                'status' => true,
                'msg' => 'data Founded!',
                'data' => $data
            ], 200);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $dataBook = Book::find($id);

        $rules = [
            'title' => 'required',
            'writer' => 'required',
            'release' => 'required|date'
        ];

        $validator = validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json([
                'status' => false,
                'msg' => 'Cannot Update Data!',
                'data' => $validator->errors()
            ],404);
        }

        $dataBook->title = $request->title;
        $dataBook->writer = $request->writer;
        $dataBook->release = $request->release;

        $post = $dataBook->save();

        return response()->json([
            'status' => true,
            'msg' => 'Succes to Update Data!'
        ], 200);
    
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $dataBook = Book::find($id);

        $post = $dataBook->delete();

        return response()->json([
            'status' => true,
            'msg' => 'Succes to Delete Data!'
        ], 200);
    }
}
