<!-- resources/views/chat/index.blade.php -->


<?php $__env->startSection('content'); ?>
<div class="container">
    <div class="row">
        <!-- Staff List -->
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">Academic Staff</div>
                <div class="card-body">
                    <div class="list-group">
                        <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <a href="#" class="list-group-item staff-member" data-id="<?php echo e($user->id); ?>">
                                <?php echo e($user->name); ?>

                            </a>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                </div>
            </div>
        </div>

        <!-- Chat Box -->
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Chat</div>
                <div class="card-body">
                    <div id="chat-messages" style="height: 400px; overflow-y: auto;">
                        <!-- Messages will be loaded here -->
                    </div>
                    <div class="input-group mt-3">
                        <input type="text" id="message-input" class="form-control">
                        <button class="btn btn-primary" id="send-message">Send</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php $__env->startPush('scripts'); ?>
<script>
let selectedUserId = null;

// Select staff member
$('.staff-member').click(function(e) {
    e.preventDefault();
    selectedUserId = $(this).data('id');
    loadMessages(selectedUserId);
});

// Load messages
function loadMessages(userId) {
    $.get(/messages/${userId}, function(messages) {
        let html = '';
        messages.forEach(message => {
            const isOwn = message.sender_id == <?php echo e(auth()->id()); ?>;
            html +=
                <div class="message ${isOwn ? 'text-right' : ''}">
                    <div class="message-content ${isOwn ? 'bg-primary text-white' : 'bg-light'}">
                        ${message.message}
                    </div>
                </div>
            ;
        });
        $('#chat-messages').html(html);
    });
}

// Send message
$('#send-message').click(function() {
    if (!selectedUserId) return;

    const message = $('#message-input').val();
    if (!message) return;

    $.post('/messages', {
        receiver_id: selectedUserId,
        message: message,
        _token: '<?php echo e(csrf_token()); ?>'
    }, function(response) {
        $('#message-input').val('');
        loadMessages(selectedUserId);
    });
});
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\Laravel\StudentReg - ZF\resources\views/index.blade.php ENDPATH**/ ?>