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