import Debug "mo:base/Debug";
import Option "mo:base/Option";
import Queue "./Queue";

actor {
    public func test() : async () {
        var q: Queue.Queue<Nat> = Queue.nil();
        
        Debug.print(debug_show(Queue.isEmpty(q)));
        
        q := Queue.enqueue(10, q);
        q := Queue.enqueue(20, q);
        q := Queue.enqueue(30, q);
        q := Queue.enqueue(40, q);

        let (v, _) = Queue.dequeue(q);
        Debug.print(debug_show(v));
        Debug.print(debug_show(Option.unwrap(v)));

        Debug.print("Dequeueing 10, 20, 30, 40...");
        while (not Queue.isEmpty(q)) {
            let (i, q0) = Queue.dequeue(q);
            Debug.print(debug_show(Option.unwrap(i)));
            q := q0;
        };

        let (i, _) = Queue.dequeue(q);
        Debug.print(debug_show(i));
        
    };
};