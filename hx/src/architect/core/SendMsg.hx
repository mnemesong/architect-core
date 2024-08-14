package architect.core;

/**
    Send some message
**/
typedef SendMsg<Req, Resp> = (req: Req) -> IStep<Resp>