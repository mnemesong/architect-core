# Architect-core
Core classes and interfaces for architect framework.


## IStep
`IStep` is an abstraction for platform-independent asyncronous imperative flow control. It may be realized through js.Promises or as syncronouns scenario or as a multiple processes control.


## Total files
- core
	- Emit
	- IStep
	- IStepManager
	- SendMsg
- data
	- IDataProvide
	- IMetaModel
	- IModel
	- IModelManager
	- Pagination


## Files overview

### architect.core.Emit
```haxe
package architect.core;

/**
    Function emits event
**/
typedef Emit<E> = (e: E) -> Void;
```

### architect.core.IStep
```haxe
package architect.core;

import haxe.Exception;

/**
    Imperative context control interface
**/
interface IStep<V>  {

    public function flatMap<V2>( f : V -> IStep<V2> ) : IStep<V2>;

	public function map<V2>( f : V -> V2 ) : IStep<V2>;

    public function onException(e: Exception -> Void): IStep<Dynamic>;
}
```

### architect.core.IStepManager
```haxe
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
```

### architect.core.Scalar
```haxe
package architect.core;

enum Scalar {
    Int(v: Int);
    String(v: String);
    Float(v: Float);
    Bool(v: Bool);
}
```

### architect.core.SendMsg
```haxe
package architect.core;

/**
    Send some message
**/
typedef SendMsg<Req, Resp> = (req: Req) -> IStep<Resp>
```

### architect.data.IDataProvider
```haxe
package architect.data;

import architect.core.IStep;
import architect.core.IStep;

interface IDataProvider<T, C> {
    /**
        Gets count of current models subcollection
    **/
    public function getCount(): IStep<Int>;

    /**
        Gets count of general models collection
    **/
    public function getTotalCount(): IStep<Int>;

    /**
        Gets current models as a array
    **/
    public function getModels(): IStep<Array<T>>;

    /**
        Gets control of data provider
    **/
    public function getControl(): C;

    /**
        Gets current pagination structure
    **/
    public function getPagination(): Null<Pagination>;

    /**
        Change pagination structure
    **/
    public function changePagination(p: Null<Pagination>): IDataProvider<T, C>;

    /**
        Gets sort map
    **/
    public function getSort(): Map<String, Dynamic<Bool>>;

    /**
        Loads and prepares data
    **/
    public function prepare(): IStep<IDataProvider<T, C>>;
}
```

### architect.data.IMetaModel
```haxe
package architect.data;

interface IMetaModel {
    /**
        Get list of string keys of attributes
    **/
    public function getAttributes(): String;

    /**
        Get attribute label if exists
    **/
    public function getAttributeLabel(a: String): Null<String>;

    /**
        Get attribute hint if exists
    **/
    public function getAttributeHint(a: String): Null<String>;

    /**
        Get model unique string identifier
    **/
    public function getModelName(): String;
}
```

### architect.data.IModel
```haxe
package architect.data;

import haxe.Exception;

interface IModel<T, C> {

    /**
        Gets a value of model
    **/
    public function getBase(): T;

    /**
        Gets the metamodel of the model
    **/
    public function getMetaModel(): IMetaModel;

    /**
        Gets the validation errors
    **/
    public function getValidationErrors(): Array<Map<String, Array<String>>>;

    /**
        Gets all values as a map
    **/
    public function toMap(): Map<String, Dynamic>;

    /**
        Gets advanced control object of the model
    **/
    public function getControl(): C;
}
```

### architect.data.IModelManager
```haxe
package architect.data;

import architect.core.IStep;

interface IModelManager<T, C> {
    /**
        Creates new model
    **/
    public function create(t: T): IModel<T, C>;

    /**
        Create default unit of the model
    **/
    public function createDefault(): IModel<T, C>;

    /**
        tries load data to the model
    **/
    public function load(v: Dynamic): IStep<IModel<T, C>>;

    /**
        Load array of data to models
    **/
    public function loadMultiple(v: Array<Dynamic>): IStep<Array<IModel<T, C>>>;

    /**
        Gets metamodel
    **/
    public function getMetaModel(): IMetaModel;
}
```

### architect.data.Pagination
```haxe
package architect.data;

typedef Pagination = {
    offset: Int, 
    limit: Int, 
    page: Int
} 
```