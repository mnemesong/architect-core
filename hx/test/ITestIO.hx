import architect.core.IStep;
import architect.core.IStepManager;

interface ITestIO extends IStepManager {
	public function readLnInt() : IStep<Int>;

	public function printLnInt( i : Int ) : IStep<Dynamic>;
}