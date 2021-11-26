# IOhubOS MQTT internal broker

[![License](https://img.shields.io/badge/license-AGPL--3.0-orange)](LICENSE)
[![CircleCI Build Status](https://circleci.com/gh/iohubos/iohubos-mqtt/tree/master.svg?style=shield)](https://circleci.com/gh/iohubos/iohubos-mqtt/tree/master)

Preconfigured `eclipse-mosquitto` container for IOhubOS.

## Environment variables

- `PERSISTENCE`: if `true`, messages are saved on db. To get real persistence across reboots, the volume `/mosquitto/data` must be persisted.
- `MAX_QUEUED_MESSAGES`: max number of queued messages. Default = 1000. Not used if persistence is not enabled.
- `AUTOSAVE_INTERVAL`: second between each message autosave. Default = 300. Not used if persistence is not enabled.
- `AUTH_USERNAME`: Username for url authentication. If absent, authentication is disabled.
- `AUTH_PASSWORD`: Password for url authentication. If absent, authentication is disabled.
- `MQTT_PORT`: Listening port. Defaults to 1883.
- `MQTT_LOG_FILE`: if `true`, logs are saved on /mosquitto/log/mosquitto.log
- `MQTT_LOG_STDOUT`: if `true`, logs sent to stdout

## License

IOhubOS is distributed under the terms of The GNU Affero General Public License v3.0.

See [LICENSE](LICENSE) for details.

SPDX-License-Identifier: AGPL-3.0-only

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS”
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
