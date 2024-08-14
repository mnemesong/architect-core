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