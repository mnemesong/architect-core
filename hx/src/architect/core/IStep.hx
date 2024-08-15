package architect.core;

import haxe.Exception;

/**
    Imperative context control interface
**/
interface IStep<V>  {

    public function flatMap<V2>( f : V -> IStep<V2> ) : IStep<V2>;

	public function map<V2>( f : V -> V2 ) : IStep<V2>;

    public function catchError(e: Exception -> V): IStep<V>;
}