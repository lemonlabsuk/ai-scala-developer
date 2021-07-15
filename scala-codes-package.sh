
iteration=$1
gpt_model=$2

if [ -z "$iteration"  ]; then
  echo "Please specify iteration"
  exit 1
fi

if [ -z "$gpt_model"  ]; then
  echo "Please specify GTP Model, e.g. 124M, 1558M"
  exit 1
fi

mkdir -p models/scala-codes
cp checkpoint/run1/checkpoint models/scala-codes
cp checkpoint/run1/model-${iteration}.* models/scala-codes
cp models/${gpt_model}/vocab.bpe models/scala-codes
cp models/${gpt_model}/*.json models/scala-codes