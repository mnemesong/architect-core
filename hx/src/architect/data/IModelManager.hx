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