from flask import Flask, jsonify, request
app=Flask(__name__)

#we are importing our function from other file
from logDeliveryAndCheck import kafka_test_msg

@app.route("/kafkamsg-service",methods=['GET'])
def index():
    print("Calling REST API method from main.py")
    print("request Obj: ", request)
    print("request method: ", request.method)
    result = kafka_test_msg()
    # if request.method=='GET':    
    #     result = kafka_test_msg()
    # else:
    #     result = "Error: Method not valid."
    if result is not None:
        return result
    else:
        return ""

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0', port=4422)