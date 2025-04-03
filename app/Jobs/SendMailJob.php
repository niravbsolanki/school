<?php

namespace App\Jobs;

use App\Notifications\SendMailNotification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;

class SendMailJob implements ShouldQueue
{
    use Queueable;

    protected $user,$announcement;
    /**
     * Create a new job instance.
     */
    public function __construct($user,$announcement)
    {
        $this->user = $user;
        $this->announcement = $announcement;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $this->user->notify(new SendMailNotification($this->user,$this->announcement));
    }
}
