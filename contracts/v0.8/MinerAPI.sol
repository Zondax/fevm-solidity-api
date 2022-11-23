// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "./types/MinerTypes.sol";
import "./cbor/MinerCbor.sol";

/// @title This contract is a proxy to a built-in Miner actor. Calling one of its methods will result in a cross-actor call being performed
/// @author Zondax AG
contract MinerAPI {
    using ChangeBeneficiaryParamsCBOR for MinerTypes.ChangeBeneficiaryParams;

    /// @notice Income and returned collateral are paid to this address
    /// @notice This address is also allowed to change the worker address for the miner
    /// @return the owner address of a Miner
    function get_owner()
        public
        view
        returns (MinerTypes.GetOwnerReturn memory)
    {
        // FIXME make actual call to the miner actor
        bytes memory owner = hex"010101";

        return MinerTypes.GetOwnerReturn(owner);
    }

    /// @param addr New owner address
    /// @notice Proposes or confirms a change of owner address.
    /// @notice If invoked by the current owner, proposes a new owner address for confirmation. If the proposed address is the current owner address, revokes any existing proposal that proposed address.
    function change_owner_address(bytes memory addr) public {
        // FIXME make actual call to the miner actor
    }

    /// @param addr The "controlling" addresses are the Owner, the Worker, and all Control Addresses.
    /// @return Whether the provided address is "controlling".
    function is_controlling_address(
        bytes memory addr
    ) public pure returns (MinerTypes.IsControllingAddressReturn memory) {
        // FIXME make actual call to the miner actor
        return MinerTypes.IsControllingAddressReturn(false);
    }

    /// @return the miner's sector size.
    function get_sector_size()
        public
        view
        returns (MinerTypes.GetSectorSizeReturn memory)
    {
        // FIXME make actual call to the miner actor
        return MinerTypes.GetSectorSizeReturn(1);
    }

    /// @notice This is calculated as actor balance - (vesting funds + pre-commit deposit + initial pledge requirement + fee debt)
    /// @notice Can go negative if the miner is in IP debt.
    /// @return the available balance of this miner.
    function get_available_balance()
        public
        pure
        returns (MinerTypes.GetAvailableBalanceReturn memory)
    {
        // FIXME make actual call to the miner actor
        return MinerTypes.GetAvailableBalanceReturn(10000000000000000000000);
    }

    /// @return the funds vesting in this miner as a list of (vesting_epoch, vesting_amount) tuples.
    function get_vesting_funds()
        public
        pure
        returns (MinerTypes.GetVestingFundsReturn memory)
    {
        // FIXME make actual call to the miner actor

        CommonTypes.VestingFunds[] memory vesting_funds;

        return MinerTypes.GetVestingFundsReturn(vesting_funds);
    }

    /// @notice Proposes or confirms a change of beneficiary address.
    /// @notice A proposal must be submitted by the owner, and takes effect after approval of both the proposed beneficiary and current beneficiary, if applicable, any current beneficiary that has time and quota remaining.
    /// @notice See FIP-0029, https://github.com/filecoin-project/FIPs/blob/master/FIPS/fip-0029.md
    function change_beneficiary(
        MinerTypes.ChangeBeneficiaryParams memory params
    ) public {
        bytes memory raw_request = params.serialize();

        // FIXME make actual call to the miner actor
    }

    /// @notice This method is for use by other actors (such as those acting as beneficiaries), and to abstract the state representation for clients.
    /// @notice Retrieves the currently active and proposed beneficiary information.
    function get_beneficiary()
        public
        view
        returns (MinerTypes.GetBeneficiaryReturn memory)
    {
        // FIXME make actual call to the miner actor

        CommonTypes.ActiveBeneficiary memory activeBeneficiary;
        CommonTypes.PendingBeneficiaryChange memory proposed;
        return MinerTypes.GetBeneficiaryReturn(activeBeneficiary, proposed);
    }
}