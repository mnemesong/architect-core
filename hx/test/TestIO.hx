import architect.core.BasicSyncStepManager;
import architect.core.IStepManager;
import architect.core.IStep;
import architect.core.SyncStep;

class TestIO implements ITestIO {

    private var stepManager: BasicSyncStepManager;

	public function new() {
        this.stepManager = new BasicSyncStepManager();
    }

	public function lift<V>( v : V ) : IStep<V> {
		return this.stepManager.lift( v );
	}

	public function readLnInt() : IStep<Int> {
		return this.stepManager.exec(() -> {
			Sys.println( "Please input integer number:" );
			return Std.parseInt( Sys.stdin().readLine() );
		} );
	}

	public function printLnInt( i : Int ) : IStep<{}> {
		return this.stepManager.exec(() -> {
			Sys.println( "Output num: " + Std.string( i ) );
			return {};
		} );
	}

	public function all<V>( all : Array<IStep<V>> ) : IStep<Array<V>> {
		return this.stepManager.all( cast all );
	}

	public function any<V>( all : Array<IStep<V>> ) : IStep<V> {
		return this.stepManager.any( cast all );
	}
}
