package architect.core;

interface IStepManager {
    /**
		Converts unit to Thenable
	**/
	public function lift<V>( v : V ) : IStep<V>;

	/**
		Await ready and success of all thenables and convert them values to array of
		same count, as a given array. 
	**/
	public function all<V>( all : Array<IStep<V>> ) : IStep<Array<V>>;

	/**
		Await ready of first success thenable and return its value as a thenable.
	**/
	public function any<V>( all : Array<IStep<V>> ) : IStep<V>;
}