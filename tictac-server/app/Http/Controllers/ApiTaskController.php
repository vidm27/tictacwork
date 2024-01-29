<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;

class ApiTaskController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $task = Task::all();
        return response()->json($task);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $task = Task::create(
            $request->only(['title', 'duration', 'moment_start', 'moment_end', 'project_id', 'tag_id'])
        );
        return response()->json($task);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $task = Task::findOrFail($id);
        return response()->json($task);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $task = Task::findOrFail($id);
        $task->update($request->only(['title', 'duration', 'moment_start', 'moment_end', 'project_id', 'tag_id']));

        $data = [
            'message' => 'Task updated succesfully',
            'client' => $task
        ];

        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $task = Task::findOrFail($id)->delete();
        $data = [
            "message" => "Task deleted succesfully",
            'client' => $task
        ];
        return response()->json($data);
    }
}
