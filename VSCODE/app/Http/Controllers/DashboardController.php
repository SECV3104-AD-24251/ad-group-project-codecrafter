<?php

namespace App\Http\Controllers;

use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        // Example user data (fetch from DB or auth user)
        $user = auth()->user();

        // Progress percentage logic (can be dynamic)
        $progress = 0; // Change to a dynamic value if needed.

        return Inertia::render('Dashboard', [
            'user' => $user,
            'progress' => $progress,
        ]);
    }
}
