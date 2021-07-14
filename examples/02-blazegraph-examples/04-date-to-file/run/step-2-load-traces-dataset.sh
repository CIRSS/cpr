# Load the Turtle-formatted trace into Blazegraph

    # destroy the traces dataset if it exists in the Blazegraph instance
    blaze destroy --dataset traces --silent

    # create the traces dataset in Blazegraph
    blaze create --dataset traces

    # load the run trace into the traces dataset in Blazegraph
    blaze import --dataset traces --format ttl --file run/.scratch/trace.ttl

