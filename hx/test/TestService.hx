import architect.core.IStep;

using Lambda;

class TestService {

	private var io : ITestIO;

	public function new(
		io : ITestIO
	) {
		this.io = io;
	}

	public function mySimpleScript() : IStep<Dynamic> {
		return this.io.all( [
			this.io.readLnInt(),
			this.io.readLnInt()
		] )
			.map( iii -> iii.map( i -> i + 10 ) )
			.map( iii -> {
				iii.iter( i -> this.io.printLnInt( i ) );
				return {};
			} );
	}
}