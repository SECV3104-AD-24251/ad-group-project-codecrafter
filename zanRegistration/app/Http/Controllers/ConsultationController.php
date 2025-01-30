<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Consultation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ConsultationController extends Controller
{
    public function index()
    {
        // Fetch advisors from the database
        $advisors = User::where('role', 'academic_staff')->get();

        // Return the consultation view
        return view('student.consultation', compact('advisors'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'receiver_id' => [
                'required',
                'exists:users,id',
                function ($attribute, $value, $fail) {
                    if (!User::where('id', $value)->where('role', 'academic_staff')->exists()) {
                        $fail('The selected advisor is invalid.');
                    }
                },
            ],
        ]);

        Consultation::create([
            'receiver_id' => $request->receiver_id,
            'sender_id' => Auth::id(),
            'scheduled_at' => now()->addDays(1), // Default scheduled time
            'status' => 'pending',
        ]);

        return redirect()->route('student.courses.consultation')
            ->with('success', 'Consultation scheduled successfully!');
    }
}