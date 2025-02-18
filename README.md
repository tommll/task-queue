# Task Queue
## Features
- [*] A queue where tasks are executed in a FIFO order
- [*] Tasks are executed in a single thread. At any given time, only one task is being executed.
- [*] The queue cannot take in new tasks until the current task is finished.
- [*] The queue can take in new tasks while the current task is being executed.
- [ ] The queue can process tasks in parallel.

# How to use
- Run task queue server: `./server`
- Log in to IRB: `./console`
- Send enqueue request: `enqueue('study')`
- Send perform request: `perform`
- Send dequeue request: `dequeue`

