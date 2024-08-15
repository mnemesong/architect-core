package architect.core;

import haxe.Exception;
import architect.core.IStep;

class SyncStep<T> implements IStep<T> {
    
    private var _v: T;
    private var _catch: Null<Exception -> T> = null;

    public function new(v: T,  _catch: Null<Exception -> T> = null) {
        this._v = v;
        this._catch = _catch;
    }

    public function flatMap<V2>(f:T -> IStep<V2>):IStep<V2> {
        try {
            return f(this._v);
        } catch (e) {
            if(this._catch != null) {
                return f(this._catch(e));
            }
            throw e;
        }
    }

    public function map<V2>(f:T -> V2):IStep<V2> {
        try {
            return new SyncStep(f(this._v));
        } catch (e) {
            if(this._catch != null) {
                return new SyncStep(f(this._catch(e)), null);
            }
            throw e;
        }
    }

    public function catchError(e:Exception -> T):IStep<T> {
        return new SyncStep(this._v, e);
    }

    public function getVal(): T {
        return this._v;
    }
}