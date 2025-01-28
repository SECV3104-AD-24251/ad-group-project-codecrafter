<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Consultation;
use App\Models\User;

class ConsultationController extends Controller
{
    public function index()
    {
        // Fetch advisors from the database
        $advisors = User::where('role', 'advisor')->get();

        // Return the consultation view
        return view('student.consultation', compact('advisors'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'advisor_id' => [
                'required',
                'exists:users,id',
                function ($attribute, $value, $fail) {
                    if (!User::where('id', $value)->where('role', 'advisor')->exists()) {
                        $fail('The selected advisor is invalid.');
                    }
                },
            ],
        ]);

        Consultation::create([
            'advisor_id' => $request->advisor_id,
            'student_id' => auth()->id(),
            'scheduled_at' => now()->addDays(1), // Default scheduled time
            'status' => 'pending',
        ]);

        return redirect()->route('student.courses.consultation')
            ->with('success', 'Consultation scheduled successfully!');
    }
}