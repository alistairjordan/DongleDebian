set -e

# Build bootloader
cd /dongle/lk2nd
make TOOLCHAIN_PREFIX=arm-none-eabi- lk1st-msm8916 -j8
cp ./build-lk1st-msm8916/emmc_appsboot.mbn ../.
# Sign it using QTestSign
cd ../qtestsign
python3 -m venv .
source bin/activate
pip3 install -r requirements.txt
./qtestsign.py aboot ../emmc_appsboot.mbn
cd ..
# Move it to the edl directory as aboot.bin!
mv emmc_appsboot-test-signed.mbn aboot.bin
