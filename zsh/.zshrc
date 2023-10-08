source ~/zshrc_init.sh

for FILE in ~/zshrc/*; do
    source $FILE
done

export PATH="/Users/andy/.local/bin:$PATH"
