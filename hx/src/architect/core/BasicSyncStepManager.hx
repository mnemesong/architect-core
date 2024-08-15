package architect.core;

import haxe.Exception;
using Lambda;

class BasicSyncStepManager implements IStepManager {
    
    public function new() {
    }

    public function lift<V>(v:V):IStep<V> {
        return new SyncStep(v);
    }

    public function all<V>(all:Array<IStep<V>>):IStep<Array<V>> {
        return new SyncStep(all.map(v -> {
            var _v: SyncStep<V> = cast v;
            return _v.getVal();
        }));
    }

    public function any<V>(all:Array<IStep<V>>):IStep<V> {
        if (all.length == 0) {
            throw  new Exception("Try to exec any of empty steps array");
        }
        return all[0]; 
    }

    /**
		Executes procedure and lift result to Thenable context
	**/
	public function exec<A>( f : () -> A ) : SyncStep<A> {
		return new SyncStep( f() );
	}
}