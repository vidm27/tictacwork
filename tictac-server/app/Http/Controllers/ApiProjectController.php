<?php

namespace App\Http\Controllers;

use App\Models\Client;
use App\Models\Project;
use Illuminate\Http\Request;

class ApiProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $projects = Project::all();
        return response()->json($projects);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        $project = new Project;
        $project->title = $request->title;
        if($request->has('client_id')){
            $project->client_id = $request->client_id;
        }elseif($request->has('client')){
            $client = new Client;
            $client->name = $request->client;
            $client->save();
            $project->client_id = $client->id;
        }
        $project->save();

        $data = [
            'message' => 'Project created succesfully',
            'project' => $project
        ];
        return response()->json($data);

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
        return Project::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
        $project = Project::findOrFail($id);
        if($request->has('client_id')){
            $project->update($request->only(['client_id']));
        }
        if($request->has('title')){
            $project->update($request->only(['title']));
        }
        $data = [
            'message' => 'Project updated succesfully',
            'project' => $project
        ];

        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $project = Project::findOrFail($id);
        $project->delete();

        $data = [
            'message' => 'Project deleted succesfully',
            'project' => $project
        ];

        return response()->json($data);
    }
}
