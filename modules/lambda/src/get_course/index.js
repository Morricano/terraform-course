const AWS = require("aws-sdk");
const dynamodb = new AWS.DynamoDB({
  region: process.env.AWS_REGION,
  apiVersion: "2012-08-10",
});

exports.handler = (event, context, callback) => {
  const params = {
    Key: {
      id: {
        S: event.id,
      },
    },
    TableName: process.env.TABLE_NAME,
  };
  dynamodb.getItem(params, (err, data) => {
    if (err) {
      console.log(err);
      callback(err);
    } else {
      // Check if item exists
      if (!data.Item) {
        callback(null, { error: "Item not found" });
        return;
      }

      // Return item details
      callback(null, {
        id: data.Item.id.S,
        title: data.Item.title.S,
        watchHref: data.Item.watchHref.S,
        authorId: data.Item.authorId.S,
        length: data.Item.length.S,
        category: data.Item.category.S,
      });
    }
  });
};
