<?php

use App\Http\Controllers\ProgressController;

Route::middleware('auth:sanctum')->get('/progress', [ProgressController::class, 'getProgress']);
