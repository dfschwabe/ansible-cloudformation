exports.index = (event, context, callback) => {
    callback(null, { message: `Hello ${process.env.SAY_HELLO_TO}! Thanks for the ${event.whatever}` });
};
