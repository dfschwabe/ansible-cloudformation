exports.index = (event, context, callback) => {
    callback(null, { message: `So long ${process.env.SAY_HELLO_TO}, and thanks for the ${event.whatever}` });
};
