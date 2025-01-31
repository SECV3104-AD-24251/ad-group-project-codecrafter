<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Preference;

class PreferenceController extends Controller
{
    public function index()
    {
        $student = auth()->user();
        $preferences = Preference::where('student_id', $student->id)->first();

        return view('student.preferences', ['preferences' => $preferences]);
    }

    public function store(Request $request)
    {
        $student = auth()->user();

        Preference::updateOrCreate(
            ['student_id' => $student->id],
            ['criteria' => json_encode($request->input('criteria'))]
        );

        return redirect()->route('preferences.index')->with('success', 'Preferences saved successfully!');
    }
}
