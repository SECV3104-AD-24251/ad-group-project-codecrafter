<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Default Broadcast Driver
    |--------------------------------------------------------------------------
    |
    | This option controls the default broadcast "driver" that will be used
    | to broadcast events. You may set this to any of the drivers listed
    | below. By default, Laravel supports Pusher and Redis.
    |
    */

    'default' => env('BROADCAST_DRIVER', 'pusher'),

    /*
    |--------------------------------------------------------------------------
    | Broadcast Connections
    |--------------------------------------------------------------------------
    |
    | Here you may configure all of the broadcast connections that will be used
    | by your application. You can use any of the drivers listed below to
    | connect to your broadcasting services, such as Pusher or Redis.
    |
    */

    'connections' => [
    'pusher' => [
        'driver' => 'pusher',
        'key' => env('5a6c4da3cd813d30338b'),
        'secret' => env('19c3c7a4c66d9fda0ceb'),
        'app_id' => env('1914987'),
        'options' => [
            'cluster' => env('ap1'),
            'useTLS' => true,
        ],
    ],
],

];
