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