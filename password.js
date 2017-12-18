exports.index = (event, context, callback) => {
    callback(null, { message: `Thanks for the ${event.whatever}, the secret information you require is ${process.env.PASSWORD}` });
};
